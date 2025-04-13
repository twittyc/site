export function enableArrowKeyNavigation(sectionSelector = '[data-section]') {
    const sections = Array.from(document.querySelectorAll(sectionSelector));
  
    let currentIndex = 0;
  
    const updateIndex = () => {
      const windowHeight = window.innerHeight;
      let closest = Infinity;
      sections.forEach((el, i) => {
        const rect = el.getBoundingClientRect();
        const distance = Math.abs(rect.top + rect.height / 2 - windowHeight / 2);
        if (distance < closest) {
          closest = distance;
          currentIndex = i;
        }
      });
    };
  
    document.addEventListener('keydown', (e) => {
      if (e.key === 'ArrowDown') {
        e.preventDefault();
        updateIndex();
        const next = sections[currentIndex + 1];
        if (next) next.scrollIntoView({ behavior: 'smooth' });
      } else if (e.key === 'ArrowUp') {
        e.preventDefault();
        updateIndex();
        const prev = sections[currentIndex - 1];
        if (prev) prev.scrollIntoView({ behavior: 'smooth' });
      }
    });
  
    // Update index on scroll to keep things accurate
    window.addEventListener('scroll', () => {
      requestAnimationFrame(updateIndex);
    });
  }
  