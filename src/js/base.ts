function isReady(cb: () => void): void {
  if (document.readyState !== 'loading') {
    cb();
  } else {
    document.addEventListener('DOMContentLoaded', cb);
  }
}

const getElementById = (id: string) => document.getElementById(id);

const getFirstElementByTag = (id: string) => document.getElementsByTagName(id)[0];

function getOffset(element: HTMLElement) {
  const box = element.getBoundingClientRect();

  return {
    top: box.top + window.pageYOffset - document.documentElement.clientTop,
    left: box.left + window.pageXOffset - document.documentElement.clientLeft,
  };
}

function animate(element: HTMLElement, speed: number, params: {[index: string]: string}): void {
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

  getElementById('mail').setAttribute('href', 'mailto:hallo@ffflorian.de');
});
