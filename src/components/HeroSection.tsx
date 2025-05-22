
import { ResumeData } from "../data/resumeData";
import { useEffect, useState } from "react";
import { ChevronDown } from "lucide-react";
import { Button } from "@/components/ui/button";

interface HeroSectionProps {
  data: ResumeData;
}

const HeroSection = ({ data }: HeroSectionProps) => {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    setVisible(true);
  }, []);

  return (
    <section id="about" className="min-h-screen relative flex flex-col items-center justify-center">
      <div className="parallax-bg bg-gradient-to-b from-blue-50 to-white" />
      
      <div className="container mx-auto px-4 relative z-10">
        <div className={`text-center transition-all duration-1000 ${visible ? "opacity-100 transform translate-y-0" : "opacity-0 transform translate-y-10"}`}>
          <div className="w-40 h-40 mx-auto mb-8 rounded-full overflow-hidden border-4 border-white shadow-lg">
            <img 
              src={data.basics.image} 
              alt={data.basics.name} 
              className="w-full h-full object-cover"
            />
          </div>
          
          <h1 className="apple-heading text-5xl md:text-7xl lg:text-8xl mb-4">{data.basics.name}</h1>
          
          <div className="h-px w-24 bg-primary mx-auto my-6"></div>
          
          <h2 className="apple-subheading text-2xl md:text-3xl text-gray-600 mb-6">{data.basics.label}</h2>
          
          <p className="apple-text max-w-2xl mx-auto text-gray-600 mb-12">
            {data.basics.summary}
          </p>
          
          <div className="flex justify-center space-x-4 mb-16">
            {data.basics.profiles.map((profile, index) => (
              <a 
                key={index}
                href={profile.url}
                target="_blank"
                rel="noopener noreferrer"
                className="bg-white p-3 rounded-full shadow-md hover:shadow-lg transition-all transform hover:scale-110"
              >
                <div className="w-6 h-6 flex items-center justify-center text-primary">
                  {profile.network === "LinkedIn" && "in"}
                  {profile.network === "GitHub" && "GH"}
                  {profile.network === "Twitter" && "X"}
                </div>
              </a>
            ))}
          </div>
          
          <Button 
            variant="outline"
            size="lg"
            className="animate-bounce"
            onClick={() => document.getElementById("experience")?.scrollIntoView({ behavior: "smooth" })}
          >
            Explore My Journey <ChevronDown className="ml-2" />
          </Button>
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
