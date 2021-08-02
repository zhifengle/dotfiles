const path = require('path');
const { rename, opendir } = require('fs/promises');

const targetPath = String.raw`C:\Users\xxx\Documents\sakura`;
// mp3 的曲目列表
const nameArr = `
01. この櫻ノ詩の下
02. 透明な白い日常
`
  .trim()
  .split('\n');

async function renameFile(dirPath, name, newName) {
  const oldFullName = path.join(dirPath, name);
  const newFullName = path.join(dirPath, newName);
  await rename(oldFullName, newFullName);
}

async function* walk(dir, recursive) {
  for await (const d of await opendir(dir)) {
    if (!recursive) {
      yield {
        name: d.name,
        path: dir,
      };
    } else if (d.isDirectory()) {
      const entry = path.join(dir, d.name);
      yield* walk(entry, true);
    } else if (d.isFile())
      yield {
        name: d.name,
        path: dir,
      };
  }
}

async function run(dir, prefix = '') {
  let counter = 0;
  for await (const p of walk(dir, false)) {
    let newName = nameArr[counter];
    if (newName && p && p.name && p.path) {
      if (prefix) {
        newName = `${newName}.${prefix}`;
      }
      await renameFile(p.path, p.name, newName);
    }
    counter++;
  }
}

run(targetPath, 'mp3');
