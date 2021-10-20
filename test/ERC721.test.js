const { expect, use } = require('chai');
const { solidity, deployContract, loadFixture } = require('ethereum-waffle');
const ERC721WithRoyalty = require('../build/ERC721WithRoyalty.json');

use(solidity);

describe('ERC721WithRoyalty', () => {
  let receiver;
  let contract;

  async function fixture([owner, receiver]) {
    const contract = await deployContract(owner, ERC721WithRoyalty, [
      'Test',
      'TST',
      receiver.address,
      15,
    ]);
    return { contract, receiver };
  }

  beforeEach(async () => {
    const snapshot = await loadFixture(fixture);
    contract = snapshot.contract;
    receiver = snapshot.receiver;
  });

  it('should return royalty infos', async () => {
    const res = await contract.royaltyInfo(0, 10000);
    expect(res[0]).to.equal(receiver.address);
    expect(res[1]).to.equal(1500);
  });

  it('should implement ERC165 interface', async () => {
    expect(await contract.supportsInterface('0x01ffc9a7')).to.equal(true);
  });

  it('should implement ERC721 interface', async () => {
    expect(await contract.supportsInterface('0x80ac58cd')).to.equal(true);
  });

  it('should implement ERC721 Metadata interface', async () => {
    expect(await contract.supportsInterface('0x80ac58cd')).to.equal(true);
  });

  it('should not implement randome interface', async () => {
    expect(await contract.supportsInterface('0x81bc58cd')).to.equal(false);
  });
});
