
.. figure:: images/kubos_logo.png
    :align: center

Overview
========

:doc:`dev-docs/changelog`

The Kubos platform provides small satellite developers the tools and
libraries necessary to quickly bring up space ready software. We
leverage multiple existing open source projects like FreeRTOS and CSP,
along with our own custom framework and SDK.

Looking to build an application on Kubos? Check out our quick start guides:

 - :doc:`KubOS Linux quick start guide <linux-docs/first-linux-project>`
 - :doc:`KubOS RT quick start guide <rt-docs/first-rt-project>`

Having issues? Want a new feature? `Come talk to
us! <https://slack.kubos.co/>`__

If for some reason Slack won't work for you, feel free to email us at
info@kubos.co.

Boards Currently Supported by Kubos
-----------------------------------

+------------+--------------------------------------------------------------------------+--------------+
| MCU Family | Description                                                              | Supported OS |
+============+==========================================================================+==============+
| ISIS       | :doc:`ISIS-OBC <linux-docs/working-with-the-iobc>`                       | KubOS Linux  |
+------------+--------------------------------------------------------------------------+--------------+
| Pumpkin    | :doc:`Pumpkin Motherboard Module 2 <linux-docs/working-with-the-mbm2>`   | KubOS Linux  |
+------------+--------------------------------------------------------------------------+--------------+
| Beaglebone | :doc:`Beaglebone Black, Rev. C <linux-docs/working-with-the-bbb>`        | KubOS Linux  |
+------------+--------------------------------------------------------------------------+--------------+
| STM32F4    | :doc:`STM32F407 Discovery Board <rt-docs/stm32f4-discovery-board-guide>` | KubOS RT     |
+------------+--------------------------------------------------------------------------+--------------+
|            | STM32F405 PyBoard                                                        | KubOS RT     |
+------------+--------------------------------------------------------------------------+--------------+
|            | STM32F405 NanoAvionics SatBus 3c0 OBC                                    | KubOS RT     |
+------------+--------------------------------------------------------------------------+--------------+
| MSP430     | :doc:`MSP430F5529 Launchpad <rt-docs/msp430-launchpad-guide>`            | KubOS RT     |
+------------+--------------------------------------------------------------------------+--------------+

.. toctree::
    :hidden:

    First Time Users <first-time-users>
    FAQs and Troubleshooting Tips <faq-troubleshooting>
    Installation Docs <installation-docs/index>
    Examples <sdk-docs/sdk-examples>
    Kubos SDK <sdk-docs/index>
    KubOS RT <rt-docs/index>
    KubOS Linux <linux-docs/index>
    Kubos Middleware <middleware/index>
    Kubos APIs <apis/index>
    Developer Docs <dev-docs/index>

Indices and tables
------------------

* :ref:`genindex`
* :ref:`search`
