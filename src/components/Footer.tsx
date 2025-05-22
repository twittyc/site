import { ResumeData } from "../data/resumeData";
import { Github, Linkedin, Mail } from "lucide-react";

interface FooterProps {
  data: ResumeData;
}

const Footer = ({ data }: FooterProps) => {
  const year = new Date().getFullYear();
  
  return (
    <footer className="bg-gray-900 text-white py-12">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          <div>
            <h3 className="font-display font-bold text-lg mb-4">{data.name}</h3>
            <div className="flex space-x-4">
              <a 
                href="https://github.com/twittyc" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-gray-300 hover:text-white transition-colors"
              >
                <Github size={24} />
              </a>
              <a 
                href="https://www.linkedin.com/in/cory-twitty-58b24969/" 
                target="_blank" 
                rel="noopener noreferrer"
                className="text-gray-300 hover:text-white transition-colors"
              >
                <Linkedin size={24} />
              </a>
              <a 
                href="mailto:cory@twitty.dev" 
                className="text-gray-300 hover:text-white transition-colors"
              >
                <Mail size={24} />
              </a>
            </div>
          </div>
          
          <div>
            <h3 className="font-display font-bold text-lg mb-4">Quick Links</h3>
            <ul className="space-y-2">
              <li><a href="#about" className="text-gray-300 hover:text-white transition-colors">About</a></li>
              <li><a href="#experience" className="text-gray-300 hover:text-white transition-colors">Experience</a></li>
              <li><a href="#skills" className="text-gray-300 hover:text-white transition-colors">Skills</a></li>
              <li><a href="#projects" className="text-gray-300 hover:text-white transition-colors">Projects</a></li>
              <li><a href="#contact" className="text-gray-300 hover:text-white transition-colors">Contact</a></li>
            </ul>
          </div>
          
          {data.location && (
            <div>
              <h3 className="font-display font-bold text-lg mb-4">Location</h3>
              <ul className="space-y-2">
                <li className="flex items-center text-gray-300">
                  <span className="mr-2">📍</span>
                  <span>{data.location.city}, {data.location.stateOrProvince}, {data.location.country}</span>
                </li>
              </ul>
            </div>
          )}
        </div>
        
        <div className="border-t border-gray-800 mt-8 pt-8 flex flex-col md:flex-row md:justify-between items-center">
          <p className="text-gray-400 mb-4 md:mb-0">
            &copy; {year} {data.name}. All rights reserved.
          </p>
          
          <p className="text-gray-400">
            Designed with ❤️
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
