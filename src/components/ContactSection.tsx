
import { ResumeData } from "../data/resumeData";
import { useState, useEffect, useRef } from "react";
import { Button } from "@/components/ui/button";
import { useToast } from "@/components/ui/use-toast";

interface ContactSectionProps {
  data: ResumeData;
}

const ContactSection = ({ data }: ContactSectionProps) => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const { toast } = useToast();
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

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // In a real app, you'd send this data to a backend
    console.log({ name, email, message });
    toast({
      title: "Message sent",
      description: "Thank you for your message. I'll get back to you soon!",
    });
    setName("");
    setEmail("");
    setMessage("");
  };

  return (
    <section id="contact" className="py-20 bg-gradient-to-b from-blue-50 to-white">
      <div className="container mx-auto px-4">
        <h2 className="apple-heading text-4xl md:text-5xl text-center mb-16">Get In Touch</h2>
        
        <div 
          ref={sectionRef}
          className="scroll-section"
        >
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
            <div>
              <h3 className="apple-subheading text-2xl mb-6">Contact Information</h3>
              
              <div className="space-y-6">
                <div className="flex items-start">
                  <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center mr-4">
                    <span className="text-primary">📧</span>
                  </div>
                  <div>
                    <h4 className="font-medium">Email</h4>
                    <a href={`mailto:${data.basics.email}`} className="text-primary hover:underline">
                      {data.basics.email}
                    </a>
                  </div>
                </div>
                
                <div className="flex items-start">
                  <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center mr-4">
                    <span className="text-primary">📱</span>
                  </div>
                  <div>
                    <h4 className="font-medium">Phone</h4>
                    <a href={`tel:${data.basics.phone}`} className="text-primary hover:underline">
                      {data.basics.phone}
                    </a>
                  </div>
                </div>
                
                <div className="flex items-start">
                  <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center mr-4">
                    <span className="text-primary">🌐</span>
                  </div>
                  <div>
                    <h4 className="font-medium">Website</h4>
                    <a href={data.basics.url} target="_blank" rel="noopener noreferrer" className="text-primary hover:underline">
                      {data.basics.url.replace("https://", "")}
                    </a>
                  </div>
                </div>
                
                <div className="flex items-start">
                  <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center mr-4">
                    <span className="text-primary">📍</span>
                  </div>
                  <div>
                    <h4 className="font-medium">Location</h4>
                    <p>{data.basics.location.city}, {data.basics.location.countryCode}</p>
                  </div>
                </div>
              </div>
            </div>
            
            <div className="bg-white rounded-xl shadow-lg p-8">
              <h3 className="apple-subheading text-2xl mb-6">Send a Message</h3>
              
              <form onSubmit={handleSubmit} className="space-y-6">
                <div>
                  <label htmlFor="name" className="block text-sm font-medium text-gray-700 mb-1">Name</label>
                  <input
                    type="text"
                    id="name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent"
                    required
                  />
                </div>
                
                <div>
                  <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-1">Email</label>
                  <input
                    type="email"
                    id="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent"
                    required
                  />
                </div>
                
                <div>
                  <label htmlFor="message" className="block text-sm font-medium text-gray-700 mb-1">Message</label>
                  <textarea
                    id="message"
                    rows={5}
                    value={message}
                    onChange={(e) => setMessage(e.target.value)}
                    className="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent"
                    required
                  ></textarea>
                </div>
                
                <Button type="submit" className="w-full">Send Message</Button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default ContactSection;
