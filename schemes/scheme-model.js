const knex = require('knex');
const knexFile = require('../knexfile');
const db = knex(knexFile.development);

module.exports = {
	find,
	findById,
	findSteps,
	add,
	remove,
	update,
};

function find() {
	return db('schemes');
}

function findById(id) {
	return db('schemes').where({ id }).first();
}

function findSteps(id) {
	return db('steps').where('scheme_id', id);
}

function add(scheme) {
	return db('schemes')
		.insert(scheme)
		.then((id) => {
			return findById(id[0]);
		});
}

function remove(id) {
	return db('schemes').where('id', id).del();
}

function update(changes, id) {
	return db('schemes')
		.where('id', id)
		.update(changes)
		.then(() => {
			return findById(id);
		});
}
