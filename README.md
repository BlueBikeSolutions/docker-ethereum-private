# Etherium private testnet in a box

What this gives you:

- Brand new etherium testnet
- Node HTTP RPC
- Blocks being mined
- An account starting with 300000 wei
- Persistent volume for the chain

# To start

Simple!

```bash
docker-compose up
```

This will initialize the genesis block, then start a node mining so that you
can interact with your new testnet.

You can connect to the node's RPC with `geth` with the following:

```bash
geth attach http://localhost:8545
```

## Primary account

The testnet pre-populates a primary account with 300000 wei. Here's the
details:

**Address:** `65c5902748130577003dda31e0979b3331430c76`<br/>
**Password:** `password`

To check that this works, you can attach to the node shell, and issue the
following command:

```
> personal.unlockAccount('0x65c5902748130577003dda31e0979b3331430c76', 'password')
true
```

# Differences to the real chain

There are many many differences between a testnet and the real chain, and I'm
no expert, but here are a few of them:

- This is obviously not secure; it's very hackable
  - Maybe you want that for a PoC
- Blocks are very easy to mine
- Blocks are mined very quickly (~1/3sec) so the chain is much faster
