const puppeteer = require('puppeteer');
const minimist = require('minimist');
const fs = require('fs');

const argv = minimist(process.argv);

const email = argv.email;
const password = argv.password;

const messagesTextFileName = 'blahblah.txt';
const messages = fs.readFileSync(messagesTextFileName).toString().split(/\r?\n/);


(async () => {
    const browser = await puppeteer.launch({headless: true, args: ['--no-sandbox']});
    const page = await browser.newPage();
    await page.goto(argv.slackUrl);

    await page.waitForSelector('#onetrust-accept-btn-handler', {timeout: 0});
    await page.focus('#email');  
    await page.keyboard.type(email);
    await page.focus('#password');  
    await page.keyboard.type(password);
    await page.click('#signin_btn');
    await page.waitForSelector('.p-download_modal__close', {timeout: 0});
    await page.click('.p-download_modal__close');

    await page.goto(argv.slackChatUrl);

    for (const message of messages) {
        await sendMessage(page, message);
        await sleep(36000);
    }

    await browser.close();
})();


async function sendMessage(pageRef, message) {
    await pageRef.waitForSelector('.ql-editor', {timeout: 0});
    await pageRef.focus('.ql-editor');  
    await pageRef.keyboard.type(message);
    await pageRef.click('.c-texty_input__button--send');
}

function sleep(ms) {
    return new Promise((resolve) => {
      setTimeout(resolve, ms);
    });
  }   