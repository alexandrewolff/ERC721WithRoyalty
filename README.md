# ERC721WithRoyalty

This is an ERC 721 implementation that embeds EIP 2981 for on chain royalties. ([see EIP 2981](https://eips.ethereum.org/EIPS/eip-2981))

The royalty parameters are global for all of the ids of the collection.

## Constructor

`string _name` : name of the collection

`string _symbol` : symbol of the collection

`address _royaltyReceiver` : address that will receive the royalties

`uint256 _royaltyPercentage` : percentage of the price to be royalty

## Instalation
```
yarn
```

## Compilation
```
yarn run build
```

## Testing
```
yarn run test
```