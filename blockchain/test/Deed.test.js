const { accounts, contract } = require('@openzeppelin/test-environment');
const { expect } = require('chai')
const {
  BN,           // Big Number support
  constants,    // Common constants, like the zero address and largest integers
  expectEvent,  // Assertions for emitted events
  expectRevert, // Assertions for transactions that should fail
} = require('@openzeppelin/test-helpers');

const Deed = contract.fromArtifact('Deed');

describe('Deed', function () {
  const [sender, receiver] =  accounts;

  beforeEach(async function () {
    // The bundled BN library is the same one web3 uses under the hood
    this.value = new BN(1);

    this.deed = await Deed.new();
  });

  it('Create deed token', async function () {
    expect(
      await this.deed.getBalanceOf('0x22d491Bde2303f2f43325b2108D26f1eAbA1e32b')
      
    ).to.equal(0)
  });


});