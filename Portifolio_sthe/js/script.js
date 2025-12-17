/* ANIMAÇÕES AO SCROLL */
const elements = document.querySelectorAll('.scroll-anim');

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('show');
      }
    });
  },
  { threshold: 0.2 }
);

elements.forEach(el => observer.observe(el));

/* MODAL DA GALERIA */
const galleryImages = document.querySelectorAll('.gallery img');

const modal = document.createElement('div');
modal.classList.add('modal');

modal.innerHTML = `
  <span class="modal-close">&times;</span>
  <img src="" alt="Imagem ampliada">
`;

document.body.appendChild(modal);

const modalImg = modal.querySelector('img');
const closeBtn = modal.querySelector('.modal-close');

galleryImages.forEach(img => {
  img.addEventListener('click', () => {
    modalImg.src = img.src;
    modal.classList.add('show');
  });
});

closeBtn.addEventListener('click', () => {
  modal.classList.remove('show');
});

modal.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.classList.remove('show');
  }
});
