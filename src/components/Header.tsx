
import { useState, useEffect } from "react";
import { ResumeData } from "../data/resumeData";

interface HeaderProps {
  data: ResumeData;
}

const Header = ({ data }: HeaderProps) => {
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };
    
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  return (
    <header className={`sticky-header ${scrolled ? "scrolled" : ""}`}>
      <div className="container mx-auto px-4 py-4 flex items-center justify-between">
        <div className="flex items-center space-x-2">
          <div className="w-8 h-8 bg-primary rounded-full flex items-center justify-center overflow-hidden">
            <span className="text-white font-bold">{data.basics.name.charAt(0)}</span>
          </div>
          <span className={`font-display font-medium transition-all duration-300 ${scrolled ? "text-primary" : "text-foreground"}`}>
            {data.basics.name.split(" ")[0]}
          </span>
        </div>
        
        <nav>
          <ul className="flex space-x-8">
            <li><a href="#about" className="text-sm font-medium hover:text-primary transition-colors">About</a></li>
            <li><a href="#experience" className="text-sm font-medium hover:text-primary transition-colors">Experience</a></li>
            <li><a href="#skills" className="text-sm font-medium hover:text-primary transition-colors">Skills</a></li>
            <li><a href="#projects" className="text-sm font-medium hover:text-primary transition-colors">Projects</a></li>
            <li><a href="#contact" className="text-sm font-medium hover:text-primary transition-colors">Contact</a></li>
          </ul>
        </nav>
      </div>
    </header>
  );
};

export default Header;
