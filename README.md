![dero Logo](https://dero.io/img/logo.png)

# Dero Miner

Image of latest [xmrig](https://github.com/xmrig/xmrig) version, a very high performance miner

## Configuration variables with default values

### Mandatory
**You can use config json file by putting it inside /home/dero/config.json**\
To generate a config file, you can use the [generator](https://config.xmrig.com/)\
**POOL_URL**=dero.miner.rocks:30182\
**POOL_USER**=derooMhHriXTfpnVtJTaAGJKGsWfZ4o7U2gRrBKRsQZJEXrfG3Ws8TpbeLckBDiG6mSjt1Fi33ydHAPbfDrDHphF34sep8P16W

### Optional
**POOL_PW**=Rancher\
**COIN**=dero

## Run

For easy start, with default configuration.

```sh
docker run -d --restart=always pmietlicki/dero-miner
```

Use your own configuration.

- Create your [wallet](https://wallet.dero.io/)
- Choose a [pool](https://dero.io/) (default: `minerrocks`)
- Run container

```sh
docker run -d --name dero-miner pmietlicki/dero-miner -e POOL_URL=dero.miner.rocks:30182 -e POOL_USER=derooMhHriXTfpnVtJTaAGJKGsWfZ4o7U2gRrBKRsQZJEXrfG3Ws8TpbeLckBDiG6mSjt1Fi33ydHAPbfDrDHphF34sep8P16W
```

|Environment       |     Description      |
|------------------|----------------------|
|POOL_USER         | Wallet Address       |
|POOL_URL          | URL of mining server |

**Docker compose**

    version: "3"
    services:
      dero-miner:
        image: pmietlicki/dero-miner
        environment:
          - POOL_URL=dero.miner.rocks:30182
          - POOL_USER=derooMhHriXTfpnVtJTaAGJKGsWfZ4o7U2gRrBKRsQZJEXrfG3Ws8TpbeLckBDiG6mSjt1Fi33ydHAPbfDrDHphF34sep8P16W
        restart: on-failure

You will then have a running dero miner that uses all the available resources for mining.

To see the output from the miner, run one of:

    $ docker logs -t -f dero-miner
    $ docker-compose logs

To update the miner:

    $ docker stop dero-miner
    $ docker rm dero-miner
    $ docker pull pmietlicki/dero-miner
    $ docker run -d --mount ...

To stop the miner:

    $ docker stop dero-miner
    $ docker-compose stop

To restart the miner:

    $ docker restart dero-miner
    $ docker-compose restart

## Build

    $ cd src/miner
    $ docker build -t pmietlicki/dero-miner .

### Donate

- XMR: `45rfqYG9iNPddvenLpjFskJUhFgqBkdhDeah3X8D8ZJM3KpKqZWCLz3ewLsVd269tZiEyQRV53Ldv2DJb6xeuFokF7SBb1p`
- RVN: `RG8Foh71fzgbrczHbUJSdWna6u4e7sgsr6`
- BTC: `bc1q8x59fwt7v9w3haa8dc5jtaurs3azjq2ut5nekp`
- NIM: `NQ51BJ7CGJA4Y35XNL7KL9VVVYQNA0K76FMB`
- DERO: `derooMhHriXTfpnVtJTaAGJKGsWfZ4o7U2gRrBKRsQZJEXrfG3Ws8TpbeLckBDiG6mSjt1Fi33ydHAPbfDrDHphF34sep8P16W`
