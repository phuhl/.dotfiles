import subprocess
import requests
import re
import os
import shutil
import lzma
import tarfile

url = 'https://dist.torproject.org/torbrowser/'


def error(message):
    print(message)
    subprocess.call(['allUserNotifySend',
                     '-a', 'Tor updater',
                     '-u', 'critical',
                     'Tor update failed',
                     message])


def notify(message):
    print(message)
    subprocess.call(['allUserNotifySend',
                     '-a', 'Tor updater',
                     'Tor update',
                     message])


def findHighest(versions):
    maxversion = max(map(lambda v: int(v[0]), versions))
    if len(versions[0]) > 1:
        highest = findHighest(
            list(map(lambda v: v[1:],
                     filter(lambda v: int(v[0]) >= maxversion, versions))))
        highest.insert(0, maxversion)
        return highest
    else:
        return [maxversion]


def untar(fname, outdir):
    if (fname.endswith("tar.xz")):
        with lzma.open(fname) as f:
            with tarfile.open(fileobj=f) as tar:
                tar.extractall(outdir)
    elif (fname.endswith("tar.gz")):
        tar = tarfile.open(fname)
        tar.extractall(outdir)
        tar.close()
    else:
        error("Not a tar.gz file: '%s '" % sys.argv[0])


def getCurrentVersion():
    r = requests.get(url, stream=True)
    if r.status_code != 200:
        error('ERROR ' + str(r.status_code))
        exit(-1)

    versions = re.findall(r'alt="\[DIR\]"> <a href="(.*?)/"', r.text)
    versions = (list(map(lambda version: re.findall(r'(\d+)(?:\.|$)', version),
                         filter(lambda version: re.match(r'^[\d.]+$', version),
                                versions))))
    return '.'.join(map(str, findHighest(versions)))


def cleanDirectory(outdir):
    try:
        shutil.rmtree(outdir)
    except:
        pass
    os.mkdir(outdir)


def downloadFile(url, outpath):
    r = requests.get(url, stream=True)
    if r.status_code != 200:
        error('ERROR ' + str(r.status_code))
        exit()

    with open(outpath, "wb") as f:
        for chunk in r:
            f.write(chunk)


def checkSig(filename, directory):
    successMessage = 'gpg: Korrekte Signatur von "Tor Browser Developers (signing key) <torbrowser@torproject.org>" [unbekannt]'
    try:
        res = subprocess.check_output(['gpg', '--verify', filename + '.asc'],
                                      stderr=subprocess.STDOUT,
                                      cwd=directory)
    except:
        cleanDirectory(directory)
        error('Signaturecheck Failed')
        exit()

    if successMessage in str(res):
        return True
    else:
        cleanDirectory(directory)
        error('Signaturecheck Failed')
        exit()


highest = getCurrentVersion()
filename = 'tor-browser-linux64-' + highest + '_en-US.tar.xz'
fileurl = url + highest + '/' + filename
outdir = './downloads/'

if os.path.isfile(outdir + filename):
    print('Tor is up to date')
    exit()

cleanDirectory(outdir)
downloadFile(fileurl, outdir + filename)
downloadFile(fileurl + '.asc', outdir + filename + '.asc')
checkSig(filename, outdir)
untar(outdir + filename, outdir)

notify('Successfully updated Tor to version ' + highest)
exit()
