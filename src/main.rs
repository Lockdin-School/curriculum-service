use env_logger::Env;
use crate::configuration::server::run;
use crate::configuration::state::init_state;

pub mod configuration;
pub mod core;
pub mod infrastructure;

#[actix_web::main]
async fn main() -> std::io::Result<()>{
    env_logger::init_from_env(Env::default().default_filter_or("info"));
    dotenv::dotenv().ok();

    // jsonwebtoken v10 requires a process-wide crypto provider to be installed
    // before any decode/verify call. This must happen once at startup.
    // let _ = jsonwebtoken::crypto::aws_lc::DEFAULT_PROVIDER.install_default(); // uncomment this
    //
    let state = init_state().await;

    run(state).await
}
