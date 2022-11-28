const {expect} = require('chai');
const {ethers} = require('hardhat');

describe.skip('Greeter', function () {
	it("Should return the new greeting once it's changed", async function () {
		const Greeter = await ethers.getContractFactory('Greeter');
		const greeter = await Greeter.deploy('Hello, world!');
		await greeter.deployed();

		expect(await greeter.greet()).to.equal('Hello, world!');

		const setGreetingTx = await greeter.setGreeting('Hola, mundo!');

		// wait until the transaction is mined
		await setGreetingTx.wait();

		expect(await greeter.greet()).to.equal('Hola, mundo!');
	});
});

describe('CoinFlip', function () {
	it('Should flip', async function () {
		const CoinFlip = await ethers.getContractFactory('CoinFlip');
		const coinflip = await CoinFlip.deploy();
		await coinflip.deployed();

		const BreakFlip = await ethers.getContractFactory('BreakFlip');
		const breakflip = await BreakFlip.deploy(coinflip.address);
		await breakflip.deployed();

		// expect(await greeter.greet()).to.equal('Hello, world!');

		// await (await coinflip.flip(true)).wait();
		// await (await coinflip.flip(true)).wait();
		// await (await coinflip.flip(true)).wait();
		// await (await coinflip.flip(true)).wait();

		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		await (await breakflip.smirk()).wait();
		// await (await coinflip.flip(true)).wait();
		// await (await coinflip.flip(true)).wait();
		// await (await coinflip.flip(true)).wait();
		// await (await coinflip.flip(true)).wait();

		// wait until the transaction is mined
		// await setGreetingTx.wait();

		// expect(await greeter.greet()).to.equal('Hola, mundo!');
	});
});
