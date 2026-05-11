import { useState, useRef, useEffect } from "react";
import { ArrowLeft, Send, Sparkles } from "lucide-react";
import { Link } from "react-router";

interface Message {
  id: number;
  text: string;
  isUser: boolean;
  timestamp: Date;
}

export function AIChat() {
  const [messages, setMessages] = useState<Message[]>([
    {
      id: 1,
      text: "안녕하세요! 저는 AI 셰프입니다. 🐾\n반려동물의 건강한 식단을 위해 도와드리겠습니다.\n\n어떤 도움이 필요하신가요?",
      isUser: false,
      timestamp: new Date(),
    },
  ]);
  const [inputValue, setInputValue] = useState("");
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const handleSend = () => {
    if (!inputValue.trim()) return;

    // Add user message
    const userMessage: Message = {
      id: messages.length + 1,
      text: inputValue,
      isUser: true,
      timestamp: new Date(),
    };

    setMessages((prev) => [...prev, userMessage]);
    setInputValue("");

    // Simulate AI response
    setTimeout(() => {
      const aiResponse: Message = {
        id: messages.length + 2,
        text: generateAIResponse(inputValue),
        isUser: false,
        timestamp: new Date(),
      };
      setMessages((prev) => [...prev, aiResponse]);
    }, 1000);
  };

  const generateAIResponse = (userInput: string): string => {
    const lowerInput = userInput.toLowerCase();
    
    if (lowerInput.includes("알러지") || lowerInput.includes("알레르기")) {
      return "알러지가 있는 반려동물을 위해서는 단백질 공급원을 신중하게 선택해야 합니다.\n\n추천 식재료:\n• 오리고기 (저알러지 단백질)\n• 고구마 (탄수화물)\n• 호박 (소화 촉진)\n\n자세한 레시피를 보여드릴까요?";
    }
    
    if (lowerInput.includes("다이어트") || lowerInput.includes("체중")) {
      return "체중 관리를 위한 저지방 식단을 추천드립니다.\n\n• 닭가슴살 + 브로콜리\n• 흰살생선 + 당근\n• 두부 + 시금치\n\n하루 급여량은 체중에 따라 다릅니다. 현재 반려동물의 체중은 몇 kg인가요?";
    }
    
    if (lowerInput.includes("강아지") || lowerInput.includes("개")) {
      return "강아지를 위한 건강한 레시피를 추천드립니다!\n\n🍖 닭가슴살 야채 볶음\n재료: 닭가슴살 100g, 당근 50g, 브로콜리 30g\n\n🐟 연어 고구마 믹스\n재료: 연어 80g, 고구마 100g, 애호박 40g\n\n어떤 레시피에 관심이 있으신가요?";
    }
    
    if (lowerInput.includes("고양이") || lowerInput.includes("냥")) {
      return "고양이를 위한 레시피를 추천드립니다!\n\n🐟 참치 브로콜리 스튜\n재료: 참치 100g, 브로콜리 30g, 달걀 1개\n\n🥩 소고기 감자 믹스\n재료: 소고기 80g, 감자 60g, 시금치 20g\n\n고양이는 필수 아미노산인 타우린이 필요하니 생선이나 육류를 충분히 포함해주세요.";
    }

    return "궁금하신 내용을 더 자세히 말씀해주시면, 맞춤형 레시피와 영양 정보를 제공해드리겠습니다.\n\n다음과 같은 정보를 알려주시면 더 정확한 상담이 가능합니다:\n• 반려동물 종류 (강아지/고양이)\n• 나이와 체중\n• 특이사항 (알러지, 질병 등)\n• 선호하는 식재료";
  };

  const quickQuestions = [
    "알러지 있는 강아지 레시피 추천해줘",
    "다이어트 식단 알려줘",
    "고양이 건강식 레시피",
    "강아지 간식 만들기",
  ];

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col">
      {/* Header */}
      <header className="bg-gradient-to-r from-orange-400 to-orange-500 px-5 py-4 shadow-md">
        <div className="flex items-center gap-3">
          <Link to="/" className="p-2 hover:bg-white/20 rounded-full transition-colors">
            <ArrowLeft className="w-6 h-6 text-white" />
          </Link>
          <div className="flex-1">
            <div className="flex items-center gap-2">
              <div className="w-10 h-10 bg-white rounded-full flex items-center justify-center">
                <Sparkles className="w-5 h-5 text-orange-500" />
              </div>
              <div>
                <h1 className="text-white">AI 셰프</h1>
                <p className="text-white/80 text-xs">맞춤 레시피 상담</p>
              </div>
            </div>
          </div>
        </div>
      </header>

      {/* Messages */}
      <div className="flex-1 overflow-y-auto px-4 py-6 max-w-md mx-auto w-full">
        {messages.map((message) => (
          <div
            key={message.id}
            className={`mb-4 flex ${message.isUser ? "justify-end" : "justify-start"}`}
          >
            <div
              className={`max-w-[80%] rounded-2xl px-4 py-3 ${
                message.isUser
                  ? "bg-orange-500 text-white rounded-br-sm"
                  : "bg-white text-gray-800 rounded-bl-sm shadow-sm"
              }`}
            >
              {!message.isUser && (
                <div className="flex items-center gap-2 mb-2">
                  <Sparkles className="w-4 h-4 text-orange-500" />
                  <span className="text-xs text-orange-500">AI 셰프</span>
                </div>
              )}
              <p className="text-sm whitespace-pre-line">{message.text}</p>
              <p
                className={`text-xs mt-2 ${
                  message.isUser ? "text-white/70" : "text-gray-400"
                }`}
              >
                {message.timestamp.toLocaleTimeString("ko-KR", {
                  hour: "2-digit",
                  minute: "2-digit",
                })}
              </p>
            </div>
          </div>
        ))}
        <div ref={messagesEndRef} />
      </div>

      {/* Quick Questions */}
      {messages.length <= 1 && (
        <div className="px-4 pb-4 max-w-md mx-auto w-full">
          <p className="text-sm text-gray-600 mb-3">💡 추천 질문</p>
          <div className="flex flex-wrap gap-2">
            {quickQuestions.map((question, index) => (
              <button
                key={index}
                onClick={() => setInputValue(question)}
                className="bg-white text-gray-700 text-sm px-4 py-2 rounded-full border border-gray-200 hover:border-orange-500 hover:text-orange-500 transition-colors"
              >
                {question}
              </button>
            ))}
          </div>
        </div>
      )}

      {/* Input */}
      <div className="bg-white border-t border-gray-200 px-4 py-4 max-w-md mx-auto w-full">
        <div className="flex items-center gap-2">
          <input
            type="text"
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            onKeyPress={(e) => e.key === "Enter" && handleSend()}
            placeholder="메시지를 입력하세요..."
            className="flex-1 px-4 py-3 bg-gray-100 rounded-full focus:outline-none focus:ring-2 focus:ring-orange-500"
          />
          <button
            onClick={handleSend}
            disabled={!inputValue.trim()}
            className="w-12 h-12 bg-orange-500 rounded-full flex items-center justify-center hover:bg-orange-600 transition-colors disabled:bg-gray-300 disabled:cursor-not-allowed"
          >
            <Send className="w-5 h-5 text-white" />
          </button>
        </div>
      </div>
    </div>
  );
}
