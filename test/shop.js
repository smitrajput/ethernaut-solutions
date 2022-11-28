const {expect} = require('chai');
const {ethers, waffle} = require('hardhat');

describe('Shop', function () {
	it('should break', async function () {
		const [owner, knower] = await ethers.getSigners();
		console.log('owner.address', owner.address);

		const Shop = await ethers.getContractFactory('Shop');
		const shop = await Shop.deploy();
		await shop.deployed();

		const Buyer = await ethers.getContractFactory('Buyer');
		const buyer = await Buyer.deploy(shop.address);
		await buyer.deployed();

		// let ABI_ = ['function annihilate()'];
		// let iface_ = new ethers.utils.Interface(ABI_);
		// let callData = iface_.encodeFunctionData('annihilate', []);

		let ABI = ['function setDetectionBot(address detectionBotAddress)'];
		let iface = new ethers.utils.Interface(ABI);

		console.log(
			'CALL_DATA',
			iface.encodeFunctionData('setDetectionBot', ['0xB37E2b1Cf6116b2DFC24184BAd327B384d168212'])
		);

		console.log('price', await shop.price());
		await (await buyer.shopBuy()).wait();
		console.log('price', await shop.price());

		// await (
		// 	await shop.transferFrom(
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
