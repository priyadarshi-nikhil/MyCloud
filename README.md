# MyCloud

Cloud Storage to store and maintain files/folders.
Users can register with MyCloud where they can regularly backuo their files/folders with a feature of Smart-View mode. Also they can restore their files from MyCloud server to local system on-demand.
Under smart-view mode they can look at the modifications their have seen over last few backups and can rollback changes from a previous state as well.

Features:
- Choice of Subscription plans (monthly,annually).
- Choice of backup plans (hourly,daily,weekly,manual(anytime)).
- Choice of Storage plans (5GB,10GB).
- View and rollback changes from last available backups using smart-view mode (Merge or Revert).
- Restore backup to local system.
- View Account information (details regarding account expiry,days left,storage left,etc)
- Mail notifications on user registration, account expiry, storage warnings,etc.
- A dedicated logging server where admin can monitor the log flow of various services.

Technologies Used:
- Ubuntu Linux 18.04 bionic.
- Bash : The project is written in Bash, provides basic command line interface for user interaction. 
- LXC : Linux containers used for implementing various seervies like DB, cloud storage, Logging server.
- MariaDB : The core database for storing the user and account information is MariaDB
- Apache : Apache used for hosting the logging server for admin.
- Postfix : Mail delivery carried out by Postfix mail server.

Monitoring with Shinken:
The various servers in use, monitored for performance using Shinken open source monitoring tool.