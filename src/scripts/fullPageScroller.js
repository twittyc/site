export function enableFullPageScroll(sectionSelector = '[data-section]') {
    const sections = Array.from(document.querySelectorAll(sectionSelector));
    let currentIndex = 0;
    let isScrolling = false;
  
    const scrollToSection = (index) => {
      isScrolling = true;
      sections[index]?.scrollIntoView({ behavior: 'smooth' });
      setTimeout(() => {
        isScrolling = false;
      }, 400);
    };
  
    const handleScroll = (e) => {
      if (isScrolling) return;
  
      const delta = e.deltaY;
  
      // Add threshold to prevent micro-scrolls
      if (Math.abs(delta) < 30) return;
  
      e.preventDefault();
  
      if (delta > 0 && currentIndex < sections.length - 1) {
        currentIndex++;
        scrollToSection(currentIndex);
      } else if (delta < 0 && currentIndex > 0) {
        currentIndex--;
        scrollToSection(currentIndex);
      }
    };
  
    const handleKey = (e) => {
      if (isScrolling) return;
  
      if (e.key === 'ArrowDown' && currentIndex < sections.length - 1) {
        currentIndex++;
        scrollToSection(currentIndex);
      } else if (e.key === 'ArrowUp' && currentIndex > 0) {
        currentIndex--;
        scrollToSection(currentIndex);
      }
    };
  
    // Keep index synced with actual scroll position
    const updateIndex = () => {
      const centerY = window.innerHeight / 2;
      sections.forEach((el, i) => {
        const rect = el.getBoundingClientRect();
        if (rect.top <= centerY && rect.bottom >= centerY) {
          currentIndex = i;
        }
      });
    };
  
    window.addEventListener('wheel', handleScroll, { passive: false });
    document.addEventListener('keydown', handleKey);
    window.addEventListener('scroll', () => requestAnimationFrame(updateIndex));
  
    requestAnimationFrame(updateIndex); // Set index on load
  }
  