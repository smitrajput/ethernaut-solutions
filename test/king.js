const {expect} = require('chai');
const {ethers} = require('hardhat');

describe('King', function () {
	it("Should return the new greeting once it's changed", async function () {
		const [owner, knower] = await ethers.getSigners();
		// console.log('owner', owner);

		const King = await ethers.getContractFactory('King');
		const king = await King.deploy({value: '1000000000000000'});
		await king.deployed();

		let prize = await king.prize();
		console.log('prize', prize);
		let kingAddress = await king._king();
		console.log('kingAddress', kingAddress);

		// const transactionHash = await knower.sendTransaction({
		// 	to: king.address,
		// 	value: ethers.utils.parseEther('0.002'), // Sends exactly 1.0 ether
		// });

		const Knight = await ethers.getContractFactory('Knight');
		const knight = await Knight.deploy(king.address);
		await knight.deployed();

		await (
			await knight.becomeKing({value: '2000000000000000', gasLimit: 1000000})
		).wait();

		prize = await king.prize();
		console.log('prize', prize);
		kingAddress = await king._king();
		console.log('kingAddress_new', kingAddress);
	});
});
