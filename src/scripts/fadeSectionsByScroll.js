export function fadeSectionsByScroll(sectionSelector = '[data-section]') {
  const sections = Array.from(document.querySelectorAll(sectionSelector));

  const update = () => {
    const windowHeight = window.innerHeight;
    const referenceY = windowHeight / 1.3; // fade in sooner

    sections.forEach((el) => {
      const rect = el.getBoundingClientRect();
      const center = rect.top + rect.height / 2;
      const distance = Math.abs(center - referenceY);

      const maxDistance = windowHeight / 2.5;
      const rawOpacity = Math.max(0, 1 - distance / maxDistance);
      const opacity = Math.pow(rawOpacity, 1.2); // smooth curve
      const translateY = 30 * (1 - opacity);

      el.style.opacity = opacity.toFixed(3);
      el.style.transform = `translateY(${translateY}px)`;
    });
  };

  window.addEventListener('scroll', update);
  window.addEventListener('resize', update);
  requestAnimationFrame(update);
}
