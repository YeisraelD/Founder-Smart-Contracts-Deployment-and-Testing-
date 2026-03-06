here moving from remix IDE noob to founder on vs (kinda having frame work) which 
consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Quick Commands (Foundry Chad Starter Pack) ha

### Build

```shell
$ forge build
```
<img width="1380" height="430" alt="image" src="https://github.com/user-attachments/assets/521458cd-cf9f-45a7-906b-dd2dabf357d0" />


### Test

```shell
$ forge test
```
<img width="1417" height="318" alt="image" src="https://github.com/user-attachments/assets/c022ebc4-a339-49f1-9169-fe7ccac0d732" />


### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```
<img width="1415" height="552" alt="image" src="https://github.com/user-attachments/assets/8671e2ff-69cd-48a5-bbd8-6594a62b9176" />


### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```
<img width="1403" height="745" alt="image" src="https://github.com/user-attachments/assets/f94bb85c-ec0b-402b-bd2b-b094f35cb725" />


### Cast

```shell
$ cast <subcommand>
```
### Call something
cast call 0xContractAddr "balanceOf(address)(uint256)" 0xYourAddr
### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
