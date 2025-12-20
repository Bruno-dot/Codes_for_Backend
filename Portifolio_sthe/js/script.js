/* =========================
   ANIMAÇÃO AO SCROLL
========================= */
const elements = document.querySelectorAll('.scroll-anim');

const observer = new IntersectionObserver(
  entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('show');
      }
    });
  },
  { threshold: 0.2 }
);

elements.forEach(el => observer.observe(el));


/* =========================
   GALERIA COM MODAL
========================= */
const galleryImages = document.querySelectorAll('.gallery img');

let currentIndex = 0;

// Cria modal dinamicamente
const modal = document.createElement('div');
modal.classList.add('modal');

const modalImg = document.createElement('img');
const closeBtn = document.createElement('span');

closeBtn.classList.add('modal-close');
closeBtn.innerHTML = '&times;';

modal.appendChild(modalImg);
modal.appendChild(closeBtn);
document.body.appendChild(modal);

// Abrir imagem
galleryImages.forEach((img, index) => {
  img.addEventListener('click', () => {
    currentIndex = index;
    openModal();
  });
});

function openModal() {
  modal.classList.add('show');
  modalImg.src = galleryImages[currentIndex].src;
}

// Fechar modal
closeBtn.addEventListener('click', closeModal);

modal.addEventListener('click', e => {
  if (e.target === modal) closeModal();
});

function closeModal() {
  modal.classList.remove('show');
}

// Navegação por teclado
document.addEventListener('keydown', e => {
  if (!modal.classList.contains('show')) return;

  if (e.key === 'ArrowRight') {
    currentIndex = (currentIndex + 1) % galleryImages.length;
    modalImg.src = galleryImages[currentIndex].src;
  }

  if (e.key === 'ArrowLeft') {
    currentIndex =
      (currentIndex - 1 + galleryImages.length) % galleryImages.length;
    modalImg.src = galleryImages[currentIndex].src;
  }

  if (e.key === 'Escape') {
    closeModal();
  }
});
