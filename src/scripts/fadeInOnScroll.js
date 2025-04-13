import { inView, animate } from 'motion';

export function fadeInOnScroll(selector) {
  inView(selector, ({ target, isIntersecting }) => {
    if (!(target instanceof HTMLElement)) return;

    animate(
      target,
      {
        opacity: isIntersecting ? 1 : 0,
        transform: isIntersecting ? 'none' : 'translateY(30px)',
      },
      {
        duration: 0.6,
        easing: 'ease-out',
      }
    );
  });
}
