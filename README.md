# Airdrop Calculator

This project provides a simple Bash script that analyzes current and potential airdrop opportunities and recommends the best airdrop for the user.

## Features
- Lists available airdrop opportunities.
- Calculates the reward/difficulty ratio for each airdrop.
- Recommends the best airdrop to farm.
- Easily update airdrop data (airdrops.csv file).
- Menu-driven and fully configurable.
- Saves all calculations and user actions to a history file (`history.log`).
- Allows you to view previous results and actions.

## Usage

1. Open a terminal and navigate to the project directory.
2. Run the script:

```bash
bash airdrop_calculator.sh
```

3. Use the menu to list, add, or delete airdrops, or to view calculation history.

## Updating Airdrop Data

Airdrop data is stored in the `airdrops.csv` file. The format is:

```
AirdropName,PotentialRewardUSD,Difficulty(1-10)
```

Example:
```
Starknet,500,7
LayerZero,300,5
ZkSync,200,4
EigenLayer,600,8
```

You can add more airdrops or update existing ones using the menu or by editing this file directly.

## Requirements
- Bash shell
- `bc` command (required for calculations)

## Contributing
If you want to contribute, please open a pull request or create an issue.

---

**Note:** This script is for demonstration purposes. Actual airdrop opportunities and rewards may vary.
# airdrop_calculator
This app calculates which airdrop would be logical to farm
