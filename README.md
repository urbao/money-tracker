
# Money Tracker

Money Tracker allows you to track your income and expense with simple interface<br/><br/>



![wallet](https://cdn-icons-png.flaticon.com/128/8984/8984212.png)<br/>


## Features

- Used to track `daily money flow`
- Type `help` for all available commands
- Written in `Bash Shell(GNU bash version 5.1.16(1)-release)`
- Only test in `Ubuntu 22.04 LTS`, and it works 



## Appendix

1. `global variable` in `line 4~9` of 'run.sh' can be changed based on `your own preference`.
2. all data is recorded and placed in `log.txt`.
3. `log.txt` will `automatically pushed to GitHub` when operation of `append` finished for file backup purpose.

## Run Locally

Go to Desktop
```bash
  cd ~/Desktop/
```

<br/>Clone the project

```bash
  git clone git@github.com:urbao/money_tracker.git
```
<br/>Go to project directory 
```bash
  cd ~/Desktop/money_tracker
```

<br/>Remove log.txt, and renew a new one
```bash
  rm log.txt
  touch log.txt
```

<br/>Allow execution of files

```bash
  chmod +x ./run.sh money_tracker.desktop
```

<br/>Move desktop file for application

```bash
  mv money_tracker.desktop ~/.local/share/applications/ 
```

<br/>Update application database

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

