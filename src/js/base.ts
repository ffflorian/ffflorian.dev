function isReady(cb: () => void): void {
  if (document.readyState !== 'loading') {
    cb();
  } else {
    document.addEventListener('DOMContentLoaded', cb);
  }
}

const getElementById = (id: string) => document.getElementById(id);

const getFirstElementByTag = (id: string) => document.getElementsByTagName(id)[0];

function getOffset(element: HTMLElement): {left: number; top: number} {
  const box = element.getBoundingClientRect();

  return {
    left: box.left + window.pageXOffset - document.documentElement.clientLeft,
    top: box.top + window.pageYOffset - document.documentElement.clientTop,
  };
}

function animate(element: HTMLElement, speed: number, params: {[key: string]: string}): void {
  element.style.transition = `all ${speed}`;
  Object.keys(params).forEach(key => (element.style[key as any] = params[key]));
}

isReady(() => {
  const fingerprintElement = getElementById('fingerprint');

  const btnPGPKeyElement = getElementById('btnPGPKey');
  if (btnPGPKeyElement) {
    btnPGPKeyElement.addEventListener('click', () => {
      if (fingerprintElement) {
        fingerprintElement.style.display = 'block';
      }
    });
  }

  const btnGalleryElement = getElementById('btnPGPKey');
  if (btnGalleryElement) {
    btnGalleryElement.addEventListener('click', () => {
      if (fingerprintElement) {
        fingerprintElement.style.display = 'block';
      }
    });
    btnGalleryElement.addEventListener('click', event => {
      event.preventDefault();
      const galleryElement = getElementById('gallery');
      if (galleryElement) {
        galleryElement.style.display = 'block';
        const offset = getOffset(galleryElement).top;
        window.scroll({top: offset, left: 0, behavior: 'smooth'});
      }
    });
  }

  const mailElement = getElementById('mail');
  if (mailElement) {
    mailElement.setAttribute('href', 'mailto:hallo@ffflorian.de');
  }
});
