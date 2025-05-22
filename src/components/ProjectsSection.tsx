
import { ResumeData } from "../data/resumeData";
import { useEffect, useRef } from "react";
import { Button } from "@/components/ui/button";

interface ProjectsSectionProps {
  data: ResumeData;
}

const ProjectsSection = ({ data }: ProjectsSectionProps) => {
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
    <section id="projects" className="py-20">
      <div className="container mx-auto px-4">
        <h2 className="apple-heading text-4xl md:text-5xl text-center mb-16">Featured Projects</h2>
        
        <div 
          ref={sectionRef}
          className="scroll-section"
        >
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {data.projects.map((project, index) => (
              <div 
                key={index}
                className="bg-white rounded-xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow border border-gray-100"
              >
                <div className="bg-gradient-to-r from-blue-600 to-purple-600 h-3"></div>
                <div className="p-8">
                  <h3 className="apple-heading text-2xl mb-4">{project.name}</h3>
                  <p className="text-gray-600 mb-6">{project.description}</p>
                  
                  <div className="space-y-3 mb-6">
                    {project.highlights.map((highlight, i) => (
                      <div key={i} className="flex items-center">
                        <div className="w-1.5 h-1.5 rounded-full bg-primary mr-3"></div>
                        <span className="text-sm text-gray-600">{highlight}</span>
                      </div>
                    ))}
                  </div>
                  
                  <Button asChild variant="outline" className="mt-2">
                    <a href={project.url} target="_blank" rel="noopener noreferrer">
                      View Project
                    </a>
                  </Button>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default ProjectsSection;
