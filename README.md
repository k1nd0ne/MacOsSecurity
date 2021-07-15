# MacOs Security Best Practice

Author : k1nd0ne </br>
Last Major Update : 13/07/2021

## Introduction
If you are working with confidential data or just worry about your local data privacy it is important to take the proper actions to make your system secure.
Having your machine stolen or hacked can happend and you should be prepared to be resilient to this kind of threats. Having a good education about the security risk is a big asset,
however, 0day vulnerabilities are often discovered and having your machine stolen can expose your data from personal data to work related data.

This guide is made to improve your personnal privacy on MacOs Operating system giving you an overview of the features you can implement to harden your machine and have a stronger, healther and more secure environement.

Obviously a 100% secure systems doesn't exist but if you already have a good understanding of cybersecurity risks and want to take a step futher into hardening your personal system then this guide is made for you !


### Cleaning you installation. 
If you want to start a fresh, I recommend making a backup of your important files (on an external hardrive with Time Machine for example) and reinstalling your mac completly. 

When booting into recovery mode for installation, format your disk and reinstall MacOs with FileVault Enabled. You should not save your recovery password in the ICloud KeyChain, keep it in a password manager (go to the **Bitwarden** section to see more about password managers). Also, do not enable localisation, Siri, and privacy related options if you do not agree with some apple terms of services. The procedure to perform a clean installation of MacOs can be found here : https://support.apple.com/en-us/HT204904. Don't forget to erase your disk before reinstalling MacOs.

## Basic hardening features
In this section I will walk you thought the features you can enable to harden your system.

### MacOs Hardening Script (MHS.sh) 
In this repository you will find a script named MHS.sh it contains a number of features you can enable to harden your system.
Take a moment to read the script and be aware about what features will be enable. This script automate the activation of the following :
- FileVault : Enable Disk Encryption : your disk will be encrypted and unreable without a password at boot;
- FileVault Eviction : An attacker can dump your computer's sleep memory and recover the filevault password. Prevent that by evicting it from the memory;
- Power Management Policies : MacOs is by default proposing several powermanagement features, those should be disables to prevent hardware attacks using thoses mechanisms.

#### Example of usage
```
user@macos$ git clone https://github.com/k1nd0ne/MacOsSecurity
user@macos$ cd MacOsSecurity
user@macos$ chmod +x MHS.sh
user@macos$ ./MHS.sh
```

### Setting up a Firmware password
We booting your system it is possible to use the MacOs firmware to boot on a usb stick for example or enter the recovery mode to format your data / re-install mac os. 
Setting a firmware password different from your session password, prevent intruder from using this firmware with malicious intentions. See : https://support.apple.com/en-au/HT204455


## Apps

In this section I will go thought the applications that I recommend using to harden your MacOs clean installation.

### Scudo

Scudo is a host firewall, it helps protect your Mac computer’s network services from unwanted connections from remote computers and improves your privacy and security by controlling all apps' network activities. You can use Scudo to choose which apps are allowed to connect to the network. 
When installing scudo, it'll ask you wich policy you want to use for inbound and outbound connexions. I personnaly use the **Ask** policy wich will ask for your authorisation for each system process or apps wanting to communicate. I recommend going through each process asking for network access and learn what they does (a quick query on any browser is enought to learn). This methods helps you choose allowed connection depending on your needs. Here is an example of process accessing the network that you could block : 
- parsec-fbf / parsecd : Looking for match on the internet via Siri when using Spotlight

I'm not using spotlight for googleing and I don't want Siri's suggestions so it's disabled by default. 
Keep in mind that what is not authorized should be always blocked.
**Some services and applications need to communicate over the network be aware when you are blocking such communications**

Scudo is very easy to use, you can download for free but you'll have regular popups asking you buy the licence if you like the product. I recommend buying it to help the creator.

You can download scudo here : https://www.murusfirewall.com/scudo/

### Bitwarden
Bitwarden is an opensource password manager. Having strong passwords and different for every services you own is the key to prevent your data from being stolen. I personnaly like bitwarden for its security, portability and the fact that it is opensource. 
You can obviously use any password manager you want. You can download bitwarden here : https://bitwarden.com/

### Browsing the internet
Having go security on your web-browser is important to have better privacy and preventing dataleaks.
Here is a few extension you can use : 
- Duckduckgo : A browser that respect your privacy
- Ublock : Add-Blocker
- HTTPSEverywhere : Force websites to use https when possible.
- Bitwarden : previously mentioned password manager web extension. 

I Also recommend customizing your browser to not save cookies and history and configure it to be in private mode by default. 

For more privacy you can also use TOR browser or a VPN solution.

## Backups 

MacOS is becoming more and more intgrated with iCloud, which is usually a great convenience to a normal user, but perceived as a potential data leak in some cases. You  should use an external encrypted disk and make regular backups with  **Time Machine**. I recommend when setting a clean MacOs to do a backup which will act as a "snapshot" of your operating system default configuration in case you want to restore it. With this you won't have to reinstall all your apps and rebuild the basic Scudo rules for example. 

## Going further 

If you are a system administrator working in an organisation using MacOs machines I recommend reading this paper which is more appropriate for hardening Mac in organisations : http://newosxbook.com/files/moxii3/AppendixA.pdf

I recommend checking it as a simple user also if you want to learn more about what you can do to harden your system.
