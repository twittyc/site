
import { useState, useEffect } from "react";
import { ChevronUp } from "lucide-react";

const ScrollToTop = () => {
  const [isVisible, setIsVisible] = useState(false);

  const toggleVisibility = () => {
    if (window.pageYOffset > 300) {
      setIsVisible(true);
    } else {
      setIsVisible(false);
    }
  };

  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: "smooth"
    });
  };

  useEffect(() => {
    window.addEventListener("scroll", toggleVisibility);
    return () => window.removeEventListener("scroll", toggleVisibility);
  }, []);

  return (
    <div className="fixed bottom-5 right-5 z-50">
      <button
        type="button"
        onClick={scrollToTop}
        className={`${
          isVisible ? "opacity-100" : "opacity-0"
        } bg-primary text-white p-3 rounded-full shadow-lg transition-all duration-300 hover:bg-primary/90 focus:outline-none`}
      >
        <ChevronUp size={24} />
      </button>
    </div>
  );
};

export default ScrollToTop;
