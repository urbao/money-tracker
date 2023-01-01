
# Money Tracker

Money Tracker allows you to track your income and expense with simple interface<br/><br/>



![wallet](https://user-images.githubusercontent.com/87600155/210162390-66085841-3fb4-4a86-8006-2f66329117fd.png)<br/>


## Features

- Used to track daily money flow
- Type 'help' for all available commands
- Written in Bash Shell(GNU bash version 5.1.16(1)-release)
- Only test in Ubuntu 22.04 LTS, and it works 



## Appendix

1. global variable in line 4~9 of 'run.sh' can be changed based on your own preference.
2. all data is recorded and placed in 'log.txt'.
3. 'log.txt' will automatically pushed to GitHub when operation of 'append' finished for file backup purpose.


## Screenshots
1.help function<br/>![help](https://user-images.githubusercontent.com/87600155/210159476-083328a0-f2a2-4149-b18e-f30becad6ea6.png)<br/><br/>
2.show function<br/>![show](https://user-images.githubusercontent.com/87600155/210159480-160c34de-3ea7-4f46-9210-65d71321ef66.png)<br/><br/>
3.find function<br/>![find](https://user-images.githubusercontent.com/87600155/210159488-e7253cb4-c4d3-4dc0-ba61-8e6aa2f1c755.png)<br/><br/>
4.total function<br/>![total](https://user-images.githubusercontent.com/87600155/210159485-9e0601db-8938-464c-b378-5f61c2e82df9.png)<br/><br/>



## Run Locally

Go to Desktop
```bash
  cd ~/Desktop/
```

Clone the project

```bash
  git clone git@github.com:urbao/money_tracker.git
```
Go to Dir 
```bash
  cd ~/Desktop/money_tracker
```

Allow execution of files

```bash
  chmod +x ./run.sh money_tracker.desktop
```

Move desktop file for application

```bash
  mv money_tracker.desktop ~/.local/share/applications/ 
```

Update application database

```bash
  update-desktop-database ~/.local/share/applications/
```

Open the application 'money tracker',and you are good to go!
### If You Failed to run the application, try followings
1. Log out or Restart, and see if it works<br/>
2. Run application manually<br/>
#### Unnecessary if above method works
```bash
  cd ~/Desktop/money_tracker/
  ./run.sh
```

## Authors

- [@urbao](https://www.github.com/urbao)


## Feedback

If you have any feedback, please reach out to us at zardforever1009@gmail.com

