
import { ResumeData } from "../data/resumeData";
import { useEffect, useRef } from "react";

interface SkillsSectionProps {
  data: ResumeData;
}

const SkillsSection = ({ data }: SkillsSectionProps) => {
  const sectionRef = useRef<HTMLDivElement>(null);
  
  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("active");
          }
        });
      },
      { threshold: 0.3 }
    );
    
    if (sectionRef.current) {
      observer.observe(sectionRef.current);
    }
    
    return () => {
      if (sectionRef.current) {
        observer.unobserve(sectionRef.current);
      }
    };
  }, []);

  return (
    <section id="skills" className="py-20 bg-gradient-to-b from-white to-blue-50">
      <div className="container mx-auto px-4">
        <h2 className="apple-heading text-4xl md:text-5xl text-center mb-16">Skills & Expertise</h2>
        
        <div 
          ref={sectionRef}
          className="scroll-section"
        >
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {data.skills.map((skillGroup, index) => (
              <div 
                key={index}
                className="bg-white rounded-xl shadow-lg p-8 hover:shadow-xl transition-shadow"
              >
                <h3 className="apple-heading text-xl mb-4">{skillGroup.name}</h3>
                <div className="mb-4">
                  <div className="h-2 w-full bg-gray-200 rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-primary rounded-full transition-all duration-1000" 
                      style={{ 
                        width: skillGroup.level === "Expert" ? "95%" : 
                              skillGroup.level === "Advanced" ? "80%" : 
                              skillGroup.level === "Intermediate" ? "65%" : "50%" 
                      }}
                    ></div>
                  </div>
                  <span className="text-sm text-gray-500 mt-1">{skillGroup.level}</span>
                </div>
                
                <div className="flex flex-wrap gap-2">
                  {skillGroup.keywords.map((keyword, i) => (
                    <span 
                      key={i}
                      className="px-3 py-1 bg-blue-50 text-primary text-sm rounded-full"
                    >
                      {keyword}
                    </span>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default SkillsSection;
