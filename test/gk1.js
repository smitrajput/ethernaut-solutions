const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('GatekeeperOne', function () {
	it('should break', async function () {
		const [owner, knower] = await ethers.getSigners();
		console.log('owner.address', owner.address);

		const GatekeeperOne = await ethers.getContractFactory('GatekeeperOne');
		const gk1 = await GatekeeperOne.deploy();
		await gk1.deployed();

		const GK1Break = await ethers.getContractFactory('GK1Break');
		const gk1Break = await GK1Break.deploy(gk1.address);
		await gk1Break.deployed();

		// await knower.sendTransaction({
		// 	to: reentrance.address,
		// 	value: ethers.utils.parseEther('0.001'),
		// });

		// let ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBal', ethBal);

		await (await gk1Break.enterGK1('0xa000000100002266')).wait();

		console.log('entrant', await gk1.entrant());

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
