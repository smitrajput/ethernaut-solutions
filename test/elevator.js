const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('Elevator', function () {
	it("Should return the new greeting once it's changed", async function () {
		const [owner, knower] = await ethers.getSigners();
		// console.log('owner', owner);

		const Elevator = await ethers.getContractFactory('Elevator');
		const elevator = await Elevator.deploy();
		await elevator.deployed();

		// await knower.sendTransaction({
		// 	to: reentrance.address,
		// 	value: ethers.utils.parseEther('0.001'),
		// });

		// let ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBal', ethBal);

		const Building = await ethers.getContractFactory('Building');
		const building = await Building.deploy(elevator.address);
		await building.deployed();

		await (await building.attackGoTo()).wait();

		console.log('top', await elevator.top());

		// await (await dr.attack('1000000000000000')).wait();

		// ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBalAfter', ethBal);
	});
});
