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
      <div className="parallax-bg bg-gradient-to-b from-background to-background/80" />
      
      <div className="container mx-auto px-4 relative z-10">
        <div className={`text-center transition-all duration-1000 ${visible ? "opacity-100 transform translate-y-0" : "opacity-0 transform translate-y-10"}`}>
          <div className="mb-8 flex justify-center">
            <div className="relative w-48 h-48 rounded-full overflow-hidden border-4 border-primary">
              <img
                src={data.headshot}
                alt={`${data.name}'s headshot`}
                className="w-full h-full object-cover"
              />
            </div>
          </div>
          <h1 className="apple-heading text-5xl md:text-7xl lg:text-8xl mb-4 text-foreground">{data.name}</h1>
          
          <div className="h-px w-24 bg-primary mx-auto my-6"></div>
          
          <h2 className="apple-subheading text-2xl md:text-3xl text-muted-foreground mb-6">{data.title}</h2>
          
          <p className="apple-text max-w-2xl mx-auto text-muted-foreground mb-12">
            {data.summary}
          </p>
          
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
