import { ResumeData } from "../data/resumeData";
import { useEffect, useRef } from "react";

interface ExperienceSectionProps {
  data: ResumeData;
}

const ExperienceSection = ({ data }: ExperienceSectionProps) => {
  const sectionRefs = useRef<(HTMLDivElement | null)[]>([]);
  
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
    
    sectionRefs.current.forEach((ref) => {
      if (ref) observer.observe(ref);
    });
    
    return () => {
      sectionRefs.current.forEach((ref) => {
        if (ref) observer.unobserve(ref);
      });
    };
  }, []);

  return (
    <section id="experience" className="py-20">
      <div className="container mx-auto px-4">
        <h2 className="apple-heading text-4xl md:text-5xl text-center mb-16">Professional Journey</h2>
        
        <div className="space-y-40 mb-20">
          {data.jobs.map((job, index) => {
            const startDate = new Date(job.startDate).getFullYear();
            const endDate = job.endDate ? new Date(job.endDate).getFullYear() : "Present";
            
            return (
              <div 
                key={index}
                ref={el => sectionRefs.current[index] = el}
                className="scroll-section"
              >
                <div className="grid grid-cols-1 md:grid-cols-2 gap-8 items-center">
                  <div className={`${index % 2 === 0 ? 'order-1' : 'order-1 md:order-2'}`}>
                    <span className="text-primary font-medium">{startDate} - {endDate}</span>
                    <h3 className="apple-heading text-3xl md:text-4xl mb-3">{job.title}</h3>
                    <h4 className="apple-subheading text-xl text-gray-600 mb-6">{job.company.name}</h4>
                    <p className="apple-text text-gray-600 mb-6">{job.summary}</p>
                    
                    <ul className="space-y-3">
                      {job.highlights.map((highlight, i) => (
                        <li key={i} className="flex items-start">
                          <span className="text-primary mr-2">•</span>
                          <span>{highlight}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                  
                  <div className={`${index % 2 === 0 ? 'order-2' : 'order-2 md:order-1'} bg-gradient-to-br from-blue-50 to-white rounded-2xl p-8 shadow-lg flex items-center justify-center`}>
                    <div className="relative w-full aspect-square max-w-md">
                      <div className="absolute inset-0 bg-gradient-to-br from-primary/10 to-primary/5 rounded-xl transform rotate-3"></div>
                      <div className="absolute inset-0 border border-primary/20 rounded-xl transform -rotate-3"></div>
                      <div className="absolute inset-0 flex items-center justify-center">
                        <img 
                          src={job.company.image || `https://placehold.co/400x400/e2e8f0/1e293b?text=${encodeURIComponent(job.company.name)}`}
                          alt={`${job.company.name} logo`}
                          className="w-48 h-48 object-cover rounded-xl shadow-xl"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
};

export default ExperienceSection;
