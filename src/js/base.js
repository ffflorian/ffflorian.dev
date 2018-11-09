const isReady = cb => {
  if (document.readyState !== 'loading') {
    cb();
  } else {
    document.addEventListener('DOMContentLoaded', cb);
  }
};

const getElementById = id => document.getElementById(id);
const getFirstElementByTag = id => document.getElementsByTagName(id)[0];

const getOffset = element => {
  const box = element.getBoundingClientRect();

  return {
    top: box.top + window.pageYOffset - document.documentElement.clientTop,
    left: box.left + window.pageXOffset - document.documentElement.clientLeft,
  };
};

const animate = (element, speed, params) => {
  element.style.transition = `all ${speed}`;
  Object.keys(params).forEach(key => (element.style[key] = params[key]));
};

isReady(() => {
  getElementById('btnPGPKey').addEventListener('click', () => (getElementById('fingerprint').style.display = 'block'));
  getElementById('btnGallery').addEventListener('click', event => {
    event.preventDefault();
    const galleryElement = getElementById('gallery');
    galleryElement.style.display = 'block';

    const offset = getOffset(galleryElement).top;

    window.scroll({top: offset, left: 0, behavior: 'smooth'});
  });
  getElementById('mail').href = 'mailto:hallo@ffflorian.de';
});
