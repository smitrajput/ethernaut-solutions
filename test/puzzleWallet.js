const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('PuzzleWallet', function () {
	it('should break', async function () {
		const [owner, knower] = await ethers.getSigners();
		console.log('owner.address', owner.address);

		const PuzzleWallet = await ethers.getContractFactory('PuzzleWallet');
		const puzzleWallet = await PuzzleWallet.deploy();
		await puzzleWallet.deployed();

		const Buyer = await ethers.getContractFactory('Buyer');
		const buyer = await Buyer.deploy(puzzleWallet.address);
		await buyer.deployed();

		// await knower.sendTransaction({
		// 	to: reentrance.address,
		// 	value: ethers.utils.parseEther('0.001'),
		// });

		// let ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBal', ethBal);

		console.log('price', await puzzleWallet.price());
		await (await buyer.puzzleWalletBuy()).wait();
		console.log('price', await puzzleWallet.price());

		// await (
		// 	await puzzleWallet.transferFrom(
		// 		owner.address,
		// 		knower.address,
		// 		'1000000000000000000000000'
		// 	)
		// ).wait();

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
