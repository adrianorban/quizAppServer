const fs = require('fs');
const path = require('path');

/**
 * Read a secret from file (on local development) or from encrypted secret inside docker containers
 *
 * @param {string} secretName
 * @returns {string}
 */
function read(secretName) {
  try {
    return fs.readFileSync(`/run/secrets/${secretName}`, 'utf8');
  } catch (err) {
    return fs.readFileSync(path.resolve(__dirname, `../secrets/${secretName}`), 'utf8');
  }
}

module.exports = {
  read: read
}