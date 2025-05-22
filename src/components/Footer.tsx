
import { ResumeData } from "../data/resumeData";

interface FooterProps {
  data: ResumeData;
}

const Footer = ({ data }: FooterProps) => {
  const year = new Date().getFullYear();
  
  return (
    <footer className="bg-gray-900 text-white py-12">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div>
            <h3 className="font-display font-bold text-lg mb-4">{data.basics.name}</h3>
            <p className="text-gray-300 mb-4">
              {data.basics.summary.substring(0, 120)}...
            </p>
            <div className="flex space-x-4">
              {data.basics.profiles.map((profile, index) => (
                <a 
                  key={index}
                  href={profile.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-gray-300 hover:text-white transition-colors"
                >
                  {profile.network}
                </a>
              ))}
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
          
          <div>
            <h3 className="font-display font-bold text-lg mb-4">Contact</h3>
            <ul className="space-y-2">
              <li className="flex items-center text-gray-300">
                <span className="mr-2">📧</span>
                <a href={`mailto:${data.basics.email}`} className="hover:text-white transition-colors">
                  {data.basics.email}
                </a>
              </li>
              <li className="flex items-center text-gray-300">
                <span className="mr-2">📱</span>
                <a href={`tel:${data.basics.phone}`} className="hover:text-white transition-colors">
                  {data.basics.phone}
                </a>
              </li>
              <li className="flex items-center text-gray-300">
                <span className="mr-2">📍</span>
                <span>{data.basics.location.city}, {data.basics.location.countryCode}</span>
              </li>
            </ul>
          </div>
        </div>
        
        <div className="border-t border-gray-800 mt-8 pt-8 flex flex-col md:flex-row md:justify-between items-center">
          <p className="text-gray-400 mb-4 md:mb-0">
            &copy; {year} {data.basics.name}. All rights reserved.
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
