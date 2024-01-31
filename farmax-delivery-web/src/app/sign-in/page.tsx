import Image from "next/image";

function BackgroundImage() {
  return (
    <div className="w-2/3 absolute top-0 left-0 h-full opacity-40 z-10">
      <Image
        alt="Motorista"
        height={500}
        width={500}
        src="/sign-in-bg.jpg"
        className="w-full h-screen object-cover z-10"
      />
      <div className="z-10 w-1/2 h-full absolute bg-gradient-to-r from-transparent to-[#dc283d] top-0 right-0"></div>
    </div>
  );
}

export default function SignInPage() {
  return (
    <main className="bg-gradient-to-r from-[#dc283d66]  to-[#dc283d] to-40% h-svh bg-opacity-60">
      <BackgroundImage />
      <div className="flex flex-col items-end relative h-full">
        <div className="w-1/2 xl:w-2/5 2xl:w-1/3 flex flex-col items-center justify-evenly absolute top-0 right-0 z-40 h-full p-12 py-24">
          <h1 className="text-gray-100 text-xl">Farmax Logo</h1>
          <div className="flex flex-col gap-4 w-full">
            <label className="form-control w-full">
              <div className="label">
                <span className="label-text text-gray-200 font-semibold text-lg">
                  Loja
                </span>
              </div>
              <input
                type="text"
                placeholder="CNPJ"
                className="input input-bordered"
              />
            </label>
            <label className="form-control w-full">
              <div className="label">
                <span className="label-text text-gray-200 font-semibold text-lg">
                  Senha
                </span>
              </div>
              <input
                type="password"
                placeholder="******"
                className="input input-bordered"
              />
            </label>
          </div>
          <button className="btn w-full mt-16 text-primary font-bold text-xl rounded-full">
            Entrar
          </button>
        </div>
      </div>
    </main>
  );
}
