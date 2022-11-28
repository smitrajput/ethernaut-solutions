const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('GatekeeperTwo', function () {
	it('should break', async function () {
		const [owner, knower] = await ethers.getSigners();
		console.log('owner.address', owner.address);

		const GatekeeperTwo = await ethers.getContractFactory('GatekeeperTwo');
		const gk2 = await GatekeeperTwo.deploy();
		await gk2.deployed();

		const GK2Break = await ethers.getContractFactory('GK2Break');
		const gk2Break = await GK2Break.deploy(gk2.address);
		await gk2Break.deployed();

		// await knower.sendTransaction({
		// 	to: reentrance.address,
		// 	value: ethers.utils.parseEther('0.001'),
		// });

		// let ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBal', ethBal);

		// await (await gk2Break.enterGK2('0xa000000100002266')).wait();

		console.log('entrant', await gk2.entrant());

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
