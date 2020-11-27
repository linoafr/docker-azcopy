# docker-azcopy : :fr:

Cette image docker est fournie en attendant que Microsoft en offre une officielle.

Issue sur github: https://github.com/Azure/azure-storage-azcopy/issues/423

Cette image s'inspire des solutions trouvées sur l'issue GitHub

Nous la maintiendrons à jour autant que possible


Si vous avez besoin de copier des blobs depuis / vers un réperoire local vous avez ce point de montage `/blobs`

```
docker run --rm -it -v ${PWD}/blobs:/blobs linoa/azcopy copy $srcUrl "/blobs" --recursive
```

---

# docker-azcopy : :us:

This docker image is provided until Microsoft offers an official one.

Issue sur github: https://github.com/Azure/azure-storage-azcopy/issues/423

This image is inspired by solutions found on the GitHub issue

We will keep it updated as much as possible



If you need to copy blobs to / from a local directory you have `/blobs` mount point

```
docker run --rm -it -v ${PWD}/blobs:/blobs linoa/azcopy copy $srcUrl "/blobs" --recursive
```