# Mercado Pago Open Source Platforms Simple Installation (WIP)

This is a repository that contains scripts to easily install open source e-commerce builders with mercadopago on a Docker environment.
Supported platforms:
- Opencart;

For all platforms, change `scripts/configs` file to setup the variables that will be used on your environment accordingly to the platform and versions that you want to install.

## Opencart

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
