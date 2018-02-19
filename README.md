# Mercado Pago Open Source Platforms Simple Installation (WIP)

This is a repository that contains scripts to easily install open source e-commerce builders with mercadopago on a Docker environment.
Supported platforms:
- Opencart;
- Prestashop;
- Woocommerce

For all platforms, change `scripts/{platform}/configs` file to setup the variables that will be used on your environment accordingly to the platform and versions that you want to install. Where platform is the platform that you want to install.

## Platforms

### Opencart

To install Opencart with [Mercado Pago cart](https://github.com/mercadopago/cart-opencart) run:

`./mercadopago install opencart`

Open a browser and go to `localhost`. Follow the installation steps.

Continue on steps 1 and 2.

Step 3: 1<sup>st</sup> form:

|Field | Data |
|-|-|
| DB Driver | MySQLi |
| Hostname | db |
| Username | opencartuser |
| Password | opencartpass |
| Database | opencartdb |
| Port | 3306 |
| Prefix | oc_ |

2<sup>nd</sup> form:

| Field | Data |
|-|-|
| Username | admin |
| Password | admin |
| email | admin@example.com |

You can change any of those data if you want. If you've changed `scripts/configs` use the same data that you used on `mysql_user`, `mysql_password`, `mysql_database` on the fields from the 1<sup>st</sup> form.

After finish the installation remove the install folder from your container. You can `./mercadopago wrapup opencart` to do so.

Now you are ready to configure MercadoPago module. Just follow the **Setup Mercado Pago** session on [developers guide for opencart](https://www.mercadopago.com.br/developers/pt/tools/modules/opencart/)

### Prestashop

To install Prestashop with [Mercado Pago cart](https://github.com/mercadopago/cart-prestashop) run:

`./mercadopago install prestashop`

Open a browser and go to `localhost`. Follow the installation steps.



After finish the installation remove the install folder from your container. You can `./mercadopago wrapup prestashop` to do so.

Now you are ready to configure MercadoPago module. Just follow the **Setup Mercado Pago** session on [developers guide for opencart](https://www.mercadopago.com.br/developers/pt/tools/modules/prestashop/)

### Woocommerce

To install Woocommerce with [Mercado Pago cart](https://github.com/mercadopago/cart-woocommerce) run:

`./mercadopago install woocommerce`

Open a browser and go to `localhost`. Follow the installation steps.

<!-- TODO: Add configuration explanation -->

Now you are ready to configure MercadoPago module. Just follow the **Setup Mercado Pago** session on [developers guide for opencart](https://www.mercadopago.com.br/developers/pt/tools/modules/woocommerce/)

## List of commands

On this project root there is a file called `mercadopago` it is a "CLI" to several commands. All listed commands bellow has the format `./mercadopago <CMD> <ARGS>`.

| CMD | ARGS | Description |
|-|-|-|
| install | `<platform name>` | Installs the platform passed as parameter|
| init | - | Prepare docker files `docker-compose-dev.yml`, `docker-compose.yml`, `docker-sync.yml` adn `Dockerfile` according with configurations made on `/scripts/configs` |
| kill | - | Do the same as `stop` and remove stopped containers and clean up `docker-sync` |
| restart | - | Executes `stop` followed by `start` |
| shell | `<user>` (optional) | Access the apache container via bash inside `/var/www/html` folder. |
| start | - | Starts `docker-sync` and `docker-compose` containers without building `Dockerfile` |
| start_build | - | Starts `docker-sync` and `docker-compose` containers building `Dockerfile` |
| stop | - | Stops `docker-sync` and `docker-compose` containers |
| wrapup | `<platform name>` | After installing some platforms will need to wrap up the installation. This command do all the job needed after installing it. |
