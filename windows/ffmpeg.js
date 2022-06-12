const path = require('path');
const { execSync } = require('child_process');
const { opendir, rename } = require('fs/promises');

const targetPath = String.raw`G:\downloads\True Tears`;

async function outputAudio(dirPath, name) {
  const videoPath = path.join(dirPath, name);
  const audioPath = path.join(
    dirPath,
    name
      .replace(/^\[.+?\]/, '')
      .replace(/\[BD.+$/, '')
      .trim() + '.mp3'
  );
  // const audioPath = path.join(dirPath, `${count}.mp3`);
  console.log('输出: ', audioPath);
  var cmd = `ffmpeg.exe -loglevel panic -i "${videoPath}" -vn -f mp3 "${audioPath}"`;
  execSync(cmd);
}

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

async function run(dir) {
  let count = 1;
  for await (const p of walk(dir, false)) {
    try {
      await outputAudio(p.path, p.name);
    } catch (error) {
      console.error(error);
    }
    count += 1;
  }
}
async function run2(dir) {
  let count = 1;
  for await (const p of walk(dir, false)) {
    try {
      let newName = p.name.replace(/\[BD.*$/, '') + '.mp3';
      await renameFile(p.path, p.name, newName);
    } catch (error) {
      console.error(error);
    }
    count += 1;
  }
}

run(targetPath);
